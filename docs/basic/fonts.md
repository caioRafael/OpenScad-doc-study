## Fontes e Fontes Externas

No OpenSCAD o comando `text()` gera um objeto 2D a partir de uma fonte. Por padrão ele usa a fonte `"Liberation Sans"`, mas é possível usar qualquer fonte instalada no sistema ou até uma fonte externa (um arquivo `.ttf` ou `.otf` guardado dentro do próprio projeto).

Trabalhar com fontes externas é útil porque:

- Mantém o projeto **portável**: qualquer pessoa que abrir o `.scad` terá a mesma fonte, sem precisar instalar nada.
- Garante que o modelo renderize **igual em qualquer máquina**.
- Permite versionar a fonte junto do código no Git.

### Usando uma fonte instalada no sistema

Se a fonte já está instalada no sistema operacional, basta informar o nome dela no parâmetro `font`:

```scad
text("OpenSCAD", font = "Arial", size = 10);
```

O nome deve ser o nome real da família da fonte, não o nome do arquivo.

### Descobrindo o nome correto da fonte

O nome que vai em `font` é o **nome da família** (family name), e não o nome do arquivo `.ttf`. Para descobrir esse nome, o OpenSCAD tem uma janela dedicada:

**Help → Font List**

Nessa janela é possível pesquisar todas as fontes disponíveis. Ao clicar em uma fonte, o OpenSCAD copia o trecho pronto para colar, por exemplo:

```scad
text("texto", font = "Nunito:style=Bold");
```

O formato completo é:

```
"NomeDaFamília:style=EstiloDaFonte"
```

| parte    | descrição                                             | exemplo                     |
| -------- | ----------------------------------------------------- | --------------------------- |
| família  | Nome da família da fonte.                             | `Nunito`, `Liberation Sans` |
| `:style` | Estilo específico da fonte (opcional).                | `Regular`, `Bold`, `Italic` |

Exemplos:

```scad
text("Negrito", font = "Nunito:style=Bold");
text("Itálico", font = "Nunito:style=Italic");
```

### Usando uma fonte externa (arquivo no projeto)

Para usar uma fonte que **não está instalada** no sistema, guarde o arquivo `.ttf`/`.otf` dentro do projeto e carregue com `use <...>` no topo do arquivo `.scad`.

Foi exatamente isso que foi feito no molde de brigadeiro em [`src/list/not-use-bosl2/4.scad`](../../src/list/not-use-bosl2/4.scad):

```scad
use <../../../fonts/Nunito.ttf>

text("Feliz dia dos PAIS", font = "Nunito", size = 12);
```

Repare que:

1. O `use <...>` aponta para o **caminho do arquivo** da fonte, relativo ao arquivo `.scad`.
2. Depois de carregada, a fonte é referenciada pelo **nome da família** (`"Nunito"`), e não pelo nome do arquivo.

> A estrutura de pastas do projeto guarda as fontes em uma pasta `fonts/` na raiz, por isso o caminho `../../../fonts/Nunito.ttf` no arquivo `4.scad`.

### `use` vs `include` para fontes

O carregamento de fontes externas é feito com `use`, e não com `include`.

| comando   | comportamento                                                                       |
| --------- | ----------------------------------------------------------------------------------- |
| `use <>`  | Carrega o recurso (fonte/módulos) sem executar o conteúdo. É o correto para fontes. |
| `include <>` | Copia e executa todo o conteúdo do arquivo. Não é usado para carregar `.ttf`.    |

### Onde encontrar fontes externas

Fontes gratuitas e com licença livre para uso em projetos podem ser baixadas em:

- [Google Fonts](https://fonts.google.com/) — como a `Nunito` usada no molde.
- [Font Squirrel](https://www.fontsquirrel.com/)

Baixe o arquivo `.ttf` ou `.otf`, coloque na pasta `fonts/` e carregue com `use <>`.

### Transformando texto em 3D

O `text()` sozinho gera apenas uma forma 2D. Para virar um sólido imprimível é preciso extrudar com `linear_extrude`:

```scad
use <../../../fonts/Nunito.ttf>

linear_extrude(height = 5)
    text("PAIS", font = "Nunito", size = 14, halign = "center", valign = "center");
```

### Texto vazado (em baixo relevo)

Uma técnica comum em moldes é criar o texto **vazado** (rebaixado), usando `difference()` combinado com `offset()`. Esse padrão aparece no molde de brigadeiro:

```scad
linear_extrude(height = 6)
    difference(){
        offset(r = 1)
            text("PAIS", font = "Nunito", size = 14, halign = "center", valign = "center");
        text("PAIS", font = "Nunito", size = 14, halign = "center", valign = "center");
    }
```

Aqui o `offset(r = 1)` cria um contorno um pouco maior ao redor do texto, e o `difference()` remove o texto de dentro desse contorno, deixando apenas a "borda" da letra — ideal para carimbar ou moldar.

### Parâmetros do `text()` relacionados a fontes

| parametro | descrição                                                        | aplicação                                       |
| --------- | ---------------------------------------------------------------- | ----------------------------------------------- |
| `font`    | Nome da família da fonte. Padrão: `"Liberation Sans"`.           | `text("Oi", font = "Nunito")` troca a fonte.    |
| `size`    | Tamanho da fonte, em mm. Padrão: `1`.                            | `text("Oi", size = 12)` aumenta o texto.        |
| `halign`  | Alinhamento horizontal: `"left"`, `"center"` ou `"right"`.       | `halign = "center"` centraliza no eixo X.       |
| `valign`  | Alinhamento vertical: `"top"`, `"center"`, `"baseline"`, `"bottom"`. | `valign = "center"` centraliza no eixo Y.   |
| `spacing` | Espaçamento entre os caracteres. Padrão: `1`.                    | `spacing = 1.2` afasta as letras.               |

### Resumo

1. Fonte instalada → só informar `font = "NomeDaFonte"`.
2. Não sabe o nome? → **Help → Font List**.
3. Fonte externa → guardar o `.ttf` no projeto e carregar com `use <caminho/arquivo.ttf>`, depois referenciar pelo nome da família.
4. Texto 2D → `linear_extrude` para virar 3D.
