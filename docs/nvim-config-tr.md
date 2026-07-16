# Neovim Config Rehberi

Bu dosya bu Neovim kurulumunun yerleşik not defteri gibi kullanılabilir. Normal modda `Space n d` ile açılır.

## Temel Mantık

- Leader tuşu `Space`.
- `Space` basınca `which-key` popup açılır ve kullanılabilir kısayolları gösterir.
- Plugin tanımları `lua/theprimeagen/lazy/` altındadır.
- Ana giriş dosyası `init.lua`, sonra `lua/theprimeagen/init.lua` yüklenir.
- Genel keymap dosyası `lua/theprimeagen/remap.lua`.
- Lazy lock dosyası `lazy-lock.json`; plugin commitlerini sabitler.

## Hızlı Başlangıç

- Dosya ara: `Space p f`
- Proje içinde metin ara: `Space p s`
- Dosya ağacı/netrw: `Space p v`
- Git dosyaları: `Ctrl-p`
- Format: `Space f`
- Terminal aç: `Space o t`
- Test çalıştır: `Space t c`
- Bu dokümanı aç: `Space n d`

## Terminal

Terminal için `toggleterm.nvim` kullanılır.

- Floating terminal: `Space o t`
- Horizontal terminal: `Space o h`
- Vertical terminal: `Space o v`
- Terminal modundan normal moda çık: `Esc`
- Alternatif hızlı aç/kapat: `Ctrl-\`

Örnek kullanım:

```text
Space o t
go test ./...
Esc
Space o t
```

Bu terminal aynı oturumu korur. Kapatıp tekrar açtığında önceki shell durumunu görürsün.

## Çoklu Dosya ve Buffer Yönetimi

Çoklu açık dosya yönetimi için `bufferline.nvim` kullanılır. Üstte açık buffer listesi görünür.

- Sonraki buffer: `Space b n`
- Önceki buffer: `Space b p`
- Buffer seç: `Space b b`
- Mevcut bufferı kapat: `Space b d`
- Soldaki bufferları kapat: `Space b h`
- Sağdaki bufferları kapat: `Space b l`
- Diğer tüm bufferları kapat: `Space b o`

Örnek akış:

```text
Space p f      dosya aç
Space p f      başka dosya aç
Space b n      sonraki dosyaya geç
Space b b      listeden dosya seç
Space b o      sadece mevcut dosya kalsın
```

## Harpoon

Harpoon sık kullanılan dosyalar arasında hızlı geçiş içindir.

- Mevcut dosyayı Harpoon listesine ekle: `Space a`
- Harpoon listesini aç: `Ctrl-e`
- 1. dosyaya git: `Ctrl-h`
- 2. dosyaya git: `Ctrl-t`
- 3. dosyaya git: `Ctrl-n`
- 4. dosyaya git: `Ctrl-s`

Örnek:

```text
main.go aç
Space a
handler.go aç
Space a
repository.go aç
Space a
Ctrl-e ile listeyi gör
Ctrl-h / Ctrl-t / Ctrl-n ile hızlı geç
```

Harpoon ve Telescope birlikte çalışır. `Ctrl-e` Harpoon listesini Telescope arayüzüyle açar.

## Telescope

Telescope proje içinde arama ve gezinme aracıdır.

- Dosya ara: `Space p f`
- Git dosyaları: `Ctrl-p`
- Cursor altındaki kelimeyi ara: `Space p w s`
- Cursor altındaki WORD değerini ara: `Space p W s`
- Elle metin girerek ara: `Space p s`
- Help tag ara: `Space v h`

Örnek:

```text
Space p s
Search > NewUser
```

Bu, proje içinde `NewUser` geçen yerleri listeler.

## Go, Rust ve Test

Test çalıştırma için `neotest` kullanılır. Go tarafında `neotest-go`, Rust tarafında `neotest-rust` adapter'ı bağlıdır.

- Cursor altındaki/en yakın testi çalıştır: `Space t c`
- Açık dosyadaki testleri çalıştır: `Space t f`
- Projedeki tüm testleri çalıştır: `Space t a`
- Test output aç: `Space t o`
- Test summary aç/kapat: `Space t s`

### Go

Go LSP için `gopls`, test çalıştırma için `neotest-go` kullanılır.

Go test adapter ayarları:

```lua
args = { "-count=1", "-timeout=60s" }
experimental = { test_table = true }
```

`-count=1` test cache kullanımını kapatır. Bu, IDE'deki gibi her çalıştırmada gerçek sonucu görmeni sağlar.

Örnek:

```go
func TestCreateUser(t *testing.T) {
    // cursor bu fonksiyonun içindeyken Space t c
}
```

### Rust

Rust LSP için `rust_analyzer`, test çalıştırma için `neotest-rust` kullanılır.

Önemli: `neotest-rust` testleri `cargo nextest` ile çalıştırır. Bunun için `cargo-nextest` sistemde kurulu olmalıdır.

Kurulum:

```sh
cargo install cargo-nextest --locked
```

Rust test adapter ayarı:

```lua
args = { "--no-capture" }
```

Örnek:

```rust
#[test]
fn creates_user() {
    // cursor bu fonksiyonun içindeyken Space t c
}

#[tokio::test]
async fn creates_user_async() {
    // tokio testleri de desteklenir
}
```

Rust test akışları Go ile aynıdır:

- Tek test: `Space t c`
- Dosyadaki testler: `Space t f`
- Tüm proje: `Space t a`
- Output: `Space t o`
- Summary: `Space t s`

## LSP

LSP keymapleri `LspAttach` sırasında bağlanır.

- Definition: `gd`
- Hover docs: `K`
- Workspace symbol: `Space v w s`
- Diagnostic float: `Space v d`
- Code action: `Space v c a`
- References: `Space v r r`
- Rename: `Space v r n`
- Signature help: insert mode `Ctrl-h`
- Sonraki diagnostic: `[d`
- Önceki diagnostic: `]d`

Kurulu LSP hedefleri:

- Lua: `lua_ls`
- Rust: `rust_analyzer`
- Go: `gopls`
- Python: `pyrefly`

## Formatting

- LSP format: `Space f`
- Formatter/Prettier mapping: `Space m p`

Go dosyalarında format için genelde `gopls` devrededir. JavaScript/TypeScript tarafında formatter plugin ayarlarına bakmak gerekir.

## Git

Git entegrasyonu için `vim-fugitive` kullanılır.

- Git status: `Space g s`

Git status penceresinde sık kullanılanlar:

- Dosya üstünde `-`: stage/unstage
- `cc`: commit başlat
- `:Git push`: push

## Comment

Comment işlemleri için `Comment.nvim` kullanılır.

- Satır yorumla/aç: `gcc`
- Visual seçim yorumla/aç: seçip `gc`

JSX/TSX gibi iç içe dil durumlarında doğru comment string seçimi için `nvim-ts-context-commentstring` kullanılır. Otomatik CursorHold güncellemesi kapalıdır; sadece comment komutu çalışırken devreye girer.

## Treesitter

Treesitter syntax highlight ve test keşfi için gereklidir.

Kurulu parser listesinde öne çıkanlar:

- `lua`
- `go`
- `gomod`
- `javascript`
- `typescript`
- `rust`
- `bash`
- `vimdoc`

Parser güncellemek için:

```vim
:TSUpdate
```

## Trouble

Diagnostics ve quickfix görünümü için Trouble kullanılır.

- Trouble aç/kapat: `Space t t`

## Zen Mode

Odak modu için Zen Mode kullanılır.

- Zen mode: `Space z z`
- Alternatif zen mapping: `Space z Z`

## Clipboard ve Edit Keymapleri

- Normal/visual yank sistem clipboard'a gider: `y`
- Normal modda tüm satırı clipboard'a yank: `Y`
- Visual paste ama register'ı bozma: seçip `Space p`
- Sil ama register'ı bozma: `Space d`
- Dosyayı executable yap: `Space x`
- Mevcut dosyayı source et: `Space Space`

## Config Dosyaları

- Genel ayarlar: `lua/theprimeagen/set.lua`
- Genel remapler: `lua/theprimeagen/remap.lua`
- Plugin setup: `lua/theprimeagen/lazy_init.lua`
- Plugin listesi: `lua/theprimeagen/lazy/`
- Bu dokümantasyon: `docs/nvim-config-tr.md`

Config değiştirince hızlı test:

```sh
nvim --headless +qa
```

Plugin yüklemek/güncellemek:

```vim
:Lazy
```

## Sık Kullanılan Akışlar

Go test yazarken:

```text
Space p f      test dosyasını aç
Space t c      cursor altındaki testi çalıştır
Space t o      output detayına bak
Space o t      terminalde manuel komut çalıştır
```

Birden fazla dosyada gezerken:

```text
Space p f      dosya aç
Space a        Harpoon'a ekle
Space p f      başka dosya aç
Space b n      bufferlar arasında dolaş
Ctrl-e         Harpoon listesini aç
```

Hata takip ederken:

```text
Space t t      Trouble aç
]d             sonraki diagnostic
Space v d      diagnostic detayını gör
Space v c a    code action çalıştır
```
