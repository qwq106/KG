import json
from datetime import datetime
import requests
from bs4 import BeautifulSoup

def fetch_national_job_data():
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
    }
    
    jobs = []
    target_urls = [
        {"url": "http://www.scs.gov.cn/", "default_type": "公务员", "default_region": "全国"},
        {"url": "http://www.mohrss.gov.cn/SYrlzyhshbzb/fwyd/SYkaoshizhaopin/zyhgjjgsydwgkzp/", "default_type": "事业单位", "default_region": "全国"}
    ]

    regions = ["北京", "上海", "天津", "重庆", "河北", "山西", "辽宁", "吉林", "黑龙江", 
               "江苏", "浙江", "安徽", "福建", "江西", "山东", "河南", "湖北", "湖南", 
               "广东", "海南", "四川", "贵州", "云南", "陕西", "甘肃", "青海", "内蒙古", 
               "广西", "西藏", "宁夏", "新疆", "兵团", "全国"]

    for source in target_urls:
        try:
            response = requests.get(source["url"], headers=headers, timeout=10)
            response.encoding = response.apparent_encoding or 'utf-8'
            soup = BeautifulSoup(response.text, 'html.parser')
            
            for link in soup.find_all('a', href=True):
                title = link.get_text(strip=True)
                url = link['href']
                
                if len(title) > 10 and any(k in title for k in ["招聘", "招考", "录用", "选调", "公告", "拟聘"]):
                    if not url.startswith("http"):
                        url = requests.compat.urljoin(source["url"], url)
                    
                    matched_region = source["default_region"]
                    for reg in regions:
                        if reg in title:
                            matched_region = reg
                            break
                    
                    job_type = source["default_type"]
                    if "公务员" in title or "选调" in title:
                        job_type = "公务员"
                    elif "事业单位" in title or "医院" in title:
                        job_type = "事业单位"
                    elif "教师" in title or "学校" in title:
                        job_type = "教师招聘"

                    jobs.append({
                        "title": title,
                        "url": url,
                        "region": matched_region,
                        "type": job_type,
                        "source": "官方网站",
                        "date": datetime.now().strftime("%Y-%m-%d"),
                        "update_time": datetime.now().strftime("%H:%M")
                    })
        except Exception as e:
            print(f"抓取出错: {e}")

    # 去重
    unique_jobs = []
    seen = set()
    for job in jobs:
        if job["title"] not in seen:
            seen.add(job["title"])
            unique_jobs.append(job)

    with open("data.json", "w", encoding="utf-8") as f:
        json.dump(unique_jobs, f, ensure_ascii=False, indent=2)
    print("数据采集完成！")

if __name__ == "__main__":
    fetch_national_job_data()