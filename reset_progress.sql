-- ============================================
-- СБРОС ПРОГРЕССА ПРОЕКТА НА 85%
-- Выполните этот скрипт в Supabase SQL Editor
-- ============================================

-- Сбрасываем прогресс на 85% (850 = 85.0% * 10)
UPDATE public.startzero_counters
SET 
  count = 850,
  updated_at = TIMEZONE('utc'::text, NOW())
WHERE counter_type = 'project_progress';

-- Если записи нет, создаем её
INSERT INTO public.startzero_counters (counter_type, count, updated_at) 
VALUES ('project_progress', 850, TIMEZONE('utc'::text, NOW()))
ON CONFLICT (counter_type) DO UPDATE 
SET 
  count = 850,
  updated_at = TIMEZONE('utc'::text, NOW());

-- Проверяем результат
SELECT 
  counter_type,
  count,
  ROUND(count::numeric / 10, 1) as progress_percent,
  updated_at
FROM public.startzero_counters
WHERE counter_type = 'project_progress';

-- Если вы видите progress_percent = 85.0 - все готово! ✅
