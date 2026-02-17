-- ============================================
-- ДОБАВЛЕНИЕ СЧЕТЧИКОВ ДЛЯ INSTAGRAM И TIKTOK
-- Выполните этот скрипт в Supabase SQL Editor
-- если записи для instagram и tiktok отсутствуют
-- ============================================

-- Добавляем записи для Instagram и TikTok, если их нет
-- Бот будет обновлять эти значения автоматически
INSERT INTO public.startzero_counters (counter_type, count, updated_at) 
VALUES 
  ('instagram', 0, TIMEZONE('utc'::text, NOW())),
  ('tiktok', 0, TIMEZONE('utc'::text, NOW()))
ON CONFLICT (counter_type) DO NOTHING;

-- Проверяем что записи созданы
SELECT 
  counter_type,
  count,
  updated_at
FROM public.startzero_counters
WHERE counter_type IN ('instagram', 'tiktok', 'telegram')
ORDER BY counter_type;

-- Если вы видите 3 записи (telegram, instagram, tiktok) - все готово! ✅
-- Бот обновит значения при следующем запуске
