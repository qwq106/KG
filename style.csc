* { box-sizing: border-box; margin: 0; padding: 0; -webkit-tap-highlight-color: transparent; }
body { font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", "PingFang SC", "Microsoft YaHei", sans-serif; background-color: #f8fafc; color: #0f172a; line-height: 1.5; padding: 12px; padding-bottom: 40px; max-width: 640px; margin: 0 auto; }
.header { background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); color: #ffffff; padding: 18px 16px; border-radius: 14px; margin-bottom: 12px; box-shadow: 0 4px 12px rgba(15, 23, 42, 0.08); }
.header h1 { font-size: 18px; font-weight: 700; display: flex; align-items: center; gap: 6px; }
.header p { font-size: 12px; color: #94a3b8; margin-top: 4px; }
.filters { position: sticky; top: 8px; z-index: 100; background: rgba(255, 255, 255, 0.92); backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px); padding: 10px; border-radius: 12px; border: 1px solid rgba(226, 232, 240, 0.8); box-shadow: 0 4px 16px rgba(0, 0, 0, 0.04); margin-bottom: 14px; display: flex; flex-direction: column; gap: 8px; }
.filters input[type="text"] { width: 100%; height: 40px; padding: 0 12px; border-radius: 8px; border: 1px solid #cbd5e1; background: #f1f5f9; font-size: 14px; outline: none; }
.filters input[type="text"]:focus { background-color: #ffffff; border-color: #2563eb; }
.select-group { display: flex; gap: 8px; }
.filters select { flex: 1; height: 36px; padding: 0 8px; border-radius: 8px; border: 1px solid #e2e8f0; background-color: #f8fafc; font-size: 13px; color: #334155; outline: none; }
.card { background: #ffffff; border-radius: 12px; padding: 14px; margin-bottom: 10px; border: 1px solid #f1f5f9; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02); display: flex; flex-direction: column; gap: 8px; }
.tags-row { display: flex; align-items: center; gap: 6px; flex-wrap: wrap; }
.tag { display: inline-flex; align-items: center; padding: 2px 7px; border-radius: 6px; font-size: 11px; font-weight: 600; }
.tag-gwy { background: #eff6ff; color: #1d4ed8; }
.tag-sydw { background: #f0fdf4; color: #15803d; }
.tag-js { background: #fffbeb; color: #b45309; }
.tag-region { background: #f1f5f9; color: #475569; }
.card-title { font-size: 15px; font-weight: 600; color: #0f172a; text-decoration: none; line-height: 1.4; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2; overflow: hidden; }
.card-title:active { color: #2563eb; }
.card-meta { display: flex; justify-content: space-between; align-items: center; font-size: 12px; color: #94a3b8; }
.empty-state { text-align: center; padding: 40px 20px; color: #94a3b8; font-size: 14px; }