// Bind <C-c> to exit insert mode
require([
  'nbextensions/vim_binding/vim_binding',
], function(nb) {
  CodeMirror.Vim.map("<C-c>", "<Esc>", "insert");
  nb.attach = (function() {
    var cached_function = nb.attach;
    return function(){
      var result = cached_function.apply(this, arguments);
      var cm_config = require("notebook/js/cell").Cell.options_default.cm_config;
      delete cm_config.extraKeys['Ctrl-C'];
      Jupyter.notebook.get_cells().map(function(cell) {
          var cm = cell.code_mirror;
          if (cm) {
              delete cm.getOption('extraKeys')['Ctrl-C'];
          }
      });
      return result;
    }
  })()
});
