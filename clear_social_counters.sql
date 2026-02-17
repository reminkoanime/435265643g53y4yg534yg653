-- ============================================
-- ОЧИСТКА СТАРЫХ СЧЕТЧИКОВ НАЖАТИЙ ДЛЯ INSTAGRAM И TIKTOK
-- Выполните этот скрипт в Supabase SQL Editor
-- Это удалит старые значения счетчиков нажатий
-- Бот создаст новые записи с реальным количеством подписчиков
-- ============================================

-- Удаляем старые записи счетчиков нажатий для Instagram и TikTok
DELETE FROM public.startzero_counters
WHERE counter_type IN ('instagram', 'tiktok');

-- Проверяем что записи удалены
SELECT 
  counter_type,
  count,
  updated_at
FROM public.startzero_counters
WHERE counter_type IN ('instagram', 'tiktok');

-- Если результат пустой - все готово! ✅
-- Бот создаст новые записи при следующем запуске с реальным количеством подписчиков

-- Если хотите создать записи сразу с нулевым значением (опционально):
-- INSERT INTO public.startzero_counters (counter_type, count, updated_at) 
-- VALUES 
--   ('instagram', 0, NOW()),
--   ('tiktok', 0, NOW())
-- ON CONFLICT (counter_type) DO NOTHING;
