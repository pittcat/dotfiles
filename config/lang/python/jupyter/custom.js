// ~/.jupyter/custom/custom.js
require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Indicate the key combination to run the commands
    km.edit_shortcuts.add_shortcut('ctrl-s', 'jupyter-notebook:save-notebook', true);
    // Update Help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});

require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Indicate the key combination to run the commands
    km.edit_shortcuts.add_shortcut('ctrl-[', CodeMirror.prototype.leaveInsertMode, true);
    km.edit_shortcuts.add_shortcut('shift-ctrl-[', CodeMirror.prototype.leaveNormalMode, true);

    // Update help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});

// enable the 'Ctrl-C' mapping
// change the code mirror configuration
var cm_config = require("notebook/js/cell").Cell.options_default.cm_config;
delete cm_config.extraKeys['Ctrl-C'];
// change settings for existing cells
Jupyter.notebook.get_cells().map(function(cell) {
    var cm = cell.code_mirror;
    if (cm) {
        delete cm.getOption('extraKeys')['Ctrl-C'];
    }
});
// map the keys
CodeMirror.Vim.map("<C-c>", "<Esc>", "insert");
