local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
  vim.notify("Could not load \"Colorizer\" package")
  return
end

-- DEFAULT_OPTIONS = {
-- 	RGB      = true;         -- #RGB hex codes
-- 	RRGGBB   = true;         -- #RRGGBB hex codes
-- 	names    = true;         -- "Name" codes like Blue
-- 	RRGGBBAA = false;        -- #RRGGBBAA hex codes
-- 	rgb_fn   = false;        -- CSS rgb() and rgba() functions
-- 	hsl_fn   = false;        -- CSS hsl() and hsla() functions
-- 	css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- 	css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- 	-- Available modes: foreground, background
-- 	mode     = 'background' | 'foreground'; -- Set the display mode.
-- }

colorizer.setup {
  'css',
  'javascript',
  'typescript',
  'java',
  'c',
}
