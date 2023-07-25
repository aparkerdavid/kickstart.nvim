(local input
  {:winopts 
   {:width 10
    :height 1
    :relative :editor
    :col 0
    :row 0}})

(local menu
  {:winopts 
   {:width 10
    :height 20
    :relative :editor
    :col 0
    :row 0}})

(fn map [list func]
  (local acc [])
  (each [_ item (ipairs list)] (table.insert acc item)))

(fn open-control [control]
  (set control.bufnr (vim.api.nvim_create_buf false true))
  (set control.winid (vim.api.nvim_open_win control.bufnr true control.winopts)))

(fn close-control [control]
  (if control.bufnr
    (vim.api.nvim_buf_delete control.bufnr {}))
  (set control.bufnr nil))

(fn bind-key [control key func]
  (vim.keymap.set :n key func {:buffer control.bufnr}))

(fn create-autocmd [control event func]
  (vim.api.nvim_create_autocmd [event] {:buffer control.bufnr :callback func}))

(fn next [])
(fn prev [])

(fn close []
  (close-control input)
  (close-control menu))

(fn open [opts]
  (open-control menu)
  (open-control input)
  (create-autocmd input "WinLeave" close)
  (create-autocmd input "TextChanged" opts.on-filter)
  (bind-key input :<ESC> close)
  (each [idx candidate (pairs opts.candidates)]
    (vim.api.nvim_buf_set_lines menu.bufnr idx idx false [candidate.text])))

(open 
  {:on-filter (fn [] nil)
   :candidates 
   [{:id 1 :text "foo"}
    {:id 2 :text "bar"}]})

{:open open}
