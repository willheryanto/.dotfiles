local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup {
  options = {
    icons_enabled = false,
    theme = "kanagawa",
    component_separators = "|",
    section_separators = "",
  },
}
