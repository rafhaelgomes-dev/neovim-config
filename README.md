````markdown
# ⚙️ Neovim Config by Rafhael Rocha Gomes

Configuração personalizada do Neovim com foco em produtividade, autocompletar com LSP, interface moderna e plugins essenciais para desenvolvimento com TypeScript, Go, Python, Java, C/C++, e mais.

## ✨ Funcionalidades

- Autocompletar com `nvim-cmp`
- Suporte a múltiplos LSPs via `mason`
- Navegação de arquivos com `nvim-tree`
- Fuzzy Finder com `telescope`
- Tema `tokyonight-night` com `onedark.nvim`
- Barra de status estilizada com `staline`
- Snippets com `LuaSnip`
- Ícones com `nvim-web-devicons`
- Atalhos úteis para produtividade

---

## 🧱 Requisitos

- [Neovim >= 0.8](https://github.com/neovim/neovim/releases)
- [git](https://git-scm.com)
- [Node.js](https://nodejs.org) (para alguns LSPs)
- [Packer](https://github.com/wbthomason/packer.nvim) instalado em `~/.local/share/nvim/site/pack/packer/start/packer.nvim`

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
````

---

## 🚀 Instalação

```bash
# Clone o repositório
git clone https://github.com/rafhaelgomes-dev/neovim-config.git ~/.config/nvim

# Abra o Neovim e instale os plugins
nvim
```

Dentro do Neovim, rode:

```vim
:PackerSync
```

> Isso instalará automaticamente todos os plugins.

---

## 🧠 LSPs Instalados

Esses LSPs são configurados automaticamente com `mason` e `lspconfig`:

* `tsserver` (JavaScript/TypeScript)
* `gopls` (Go)
* `pyright` (Python)
* `jdtls` (Java)
* `clangd` (C/C++)

Você pode gerenciar a instalação deles com o comando:

```vim
:Mason
```

---

## ⌨️ Atalhos Úteis

| Atalho     | Ação                                     |
| ---------- | ---------------------------------------- |
| `Ctrl + s` | Salvar arquivo                           |
| `Ctrl + b` | Alternar o `nvim-tree`                   |
| `Ctrl + p` | Abrir o `Telescope` para buscar arquivos |
| `q`        | Sair do Neovim                           |
| `Ctrl + a` | Selecionar todo o conteúdo do buffer     |
| `gd`       | Ir para definição                        |
| `gr`       | Procurar referências                     |
| `gi`       | Ir para implementação                    |
| `K`        | Mostrar documentação da função           |

---

## 🎨 Temas

Atualmente, está sendo usado:

* `tokyonight-night` (ativo)
* `onedark.nvim` (carregado para estilo de LSP e outros componentes)

Você pode alterar a linha final em `settings.lua` para trocar o tema:

```lua
vim.cmd[[colorscheme tokyonight-night]]
-- ou
vim.cmd[[colorscheme onedark]]
```

---

## 📁 Estrutura do Projeto

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── settings.lua
│   ├── mappings.lua
│   └── plugins/
│       └── plugins.lua
```

---

## 🛠️ Manutenção

### Atualizar Plugins

Dentro do Neovim:

```vim
:PackerSync
```

### Recompilar plugins ao alterar `plugins.lua`

Ao salvar o arquivo `plugins.lua`, o `PackerCompile` é automaticamente executado por este autocomando:

```lua
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
```

---

## 🧠 Dica

Recomenda-se utilizar um terminal com suporte a **true colors** e **fontes com ícones Nerd Fonts** (como `FiraCode Nerd Font` ou `JetBrainsMono Nerd Font`).

---

## 🧔 Autor

Feito com ❤️ por [Rafhael Rocha Gomes](https://www.linkedin.com/in/rafhael-rocha/)
