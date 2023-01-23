local status, ib = pcall(require, "indent_blankline")
if not status then
  return
end

ib.setup {
  char = "┊",
  show_trailing_blankline_indent = false,
}
