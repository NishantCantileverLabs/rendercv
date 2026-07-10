# Adopt a Typst Prototype as a Custom Theme

Create a RenderCV theme from a Typst prototype file without writing Jinja2 templates or Pydantic models by hand.

## When to Use This

Use `rendercv adopt-template` when you:

- Have a Typst design you want to turn into a RenderCV theme
- Want to prototype a CV design in pure Typst and convert it mechanically to a theme
- Want to avoid writing Jinja2 templates and `__init__.py` from scratch
- Need a theme file structure with simplified, Typst-like Jinja2 templates

## Prerequisites

- A Typst prototype file with comment markers (see [convention](#comment-markers) below)
- RenderCV installed (`pip install rendercv`)

## Basic Usage

```bash
rendercv adopt-template mytheme --prototype my-design.typ
```

This creates a `mytheme/` folder with:

```
mytheme/
  __init__.py                 # Pydantic model (extends ClassicTheme)
  Preamble.j2.typ             # Page setup and configuration
  Header.j2.typ               # Name, headline, connections
  SectionBeginning.j2.typ     # Section title opening
  SectionEnding.j2.typ        # Section closing
  entries/
    EducationEntry.j2.typ     # One per entry type from your prototype
    ExperienceEntry.j2.typ
    NormalEntry.j2.typ        # Fallback: built-in template if not in prototype
    ...
```

## Comment Markers

Your prototype file uses Typst comments to tell the tool how to split the file into templates.

### Structure Markers

| Marker | Purpose | Example |
|--------|---------|---------|
| `// @template <Name>` | Start a template region | `// @template Header` |
| `// @entry <EntryType>` | Start an entry type definition | `// @entry EducationEntry` |
| `// @end` | End the current region | `// @end` |

### Flow Control Markers

| Marker | Purpose | Jinja2 Output |
|--------|---------|---------------|
| `// @for <var> in <iter>` | Loop | `{% for var in iter %}` |
| `// @endfor` | End loop | `{% endfor %}` |
| `// @if <condition>` | Conditional | `{% if condition %}` |
| `// @endif` | End conditional | `{% endif %}` |

## Prototype File Example

Here is a complete example prototype file:

```typst
// @template Preamble
#import "@preview/rendercv:0.3.0": *

#show: rendercv.with(
  page-size: "us-letter",
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(0, 79, 144),
  typography-font-family-body: "Libertinus Serif",
  typography-line-spacing: 0.2em,
)

// @template Header
= John Doe
#headline(Software Engineer)

#connections(
// @for connection in cv._connections
  [john@email.com],
// @endfor
)

// @template SectionBeginning
== Education

// @if entry_type in ["ReversedNumberedEntry"]
#reversed-numbered-entries(
  [
// @endif

// @template SectionEnding
// @if entry_type in ["ReversedNumberedEntry"]
  ],
)
// @endif

// @entry EducationEntry
#education-entry(
  [*MIT*, PhD in Computer Science],
  [Cambridge, MA\nSep 2018 – Jun 2023],
  degree-column: [PhD],
)

// @entry ExperienceEntry
#regular-entry(
  [*Google*, Senior Engineer],
  [Mountain View, CA\nJan 2020 – Present],
)

// @entry OneLineEntry
**Languages:** English (native), Spanish (fluent)

// @entry BulletEntry
- Python, JavaScript, C++

// @entry NumberedEntry
+ Deep Learning for Computer Vision

// @entry ReversedNumberedEntry
+ Latest research publication

// @entry TextEntry
Plain text entry
```

## Automatic Variable Substitution

The tool recognizes sample data in your prototype and replaces it with Jinja2 variable references automatically:

### Header Context

| Prototype | Generated Template |
|-----------|-------------------|
| `= John Doe` | `= {{ cv.name }}` |
| `#headline(Engineer)` | `#headline({{ cv.headline }})` |
| `[email@example.com]` inside loop | `[{{ connection }}]` |

### Section Context

| Prototype | Generated Template |
|-----------|-------------------|
| `== Education` | `== {{ section_title }}` |

### Entry Context

Entries are matched by their Typst function name. Positional and named arguments map automatically:

**`#education-entry(...)`**

| Prototype Argument | Generated |
|--------------------|-----------|
| 1st positional `[...]` | `[{{ entry.main_column }}]` |
| 2nd positional `[...]` | `[{{ entry.date_and_location_column }}]` |
| `degree-column: [...]` | `degree-column: [{{ entry.degree_column }}]` |

**`#regular-entry(...)`**

| Prototype Argument | Generated |
|--------------------|-----------|
| 1st positional `[...]` | `[{{ entry.main_column }}]` |
| 2nd positional `[...]` | `[{{ entry.date_and_location_column }}]` |

### Inline Entry Types

Simple entries without function wrappers are replaced entirely:

| Entry Type | Generated Template |
|------------|-------------------|
| OneLineEntry | `{{ entry.main_column }}` |
| BulletEntry | `- {{ entry.bullet }}` |
| NumberedEntry | `+ {{ entry.number }}` |
| ReversedNumberedEntry | `+ {{ entry.reversed_number }}` |
| TextEntry | `{{ entry }}` |

## How It Works

1. **Copy** — all built-in templates are copied to the theme folder as a starting point
2. **Parse** — the prototype is split into regions by `// @template` and `// @entry` markers
3. **Transform** — comment markers are converted to Jinja2 syntax; sample values are replaced with variables
4. **Override** — prototype regions overwrite the corresponding built-in files
5. **Generate** — `__init__.py` is created with a Pydantic model extending `ClassicTheme`

Entry types not in your prototype keep their built-in templates.

## Entry Types Reference

| Entry Type | Typst Function | Fields |
|------------|----------------|--------|
| `EducationEntry` | `#education-entry(...)` | `main_column`, `date_and_location_column`, `degree_column` |
| `ExperienceEntry` | `#regular-entry(...)` | `main_column`, `date_and_location_column` |
| `NormalEntry` | `#regular-entry(...)` | `main_column`, `date_and_location_column` |
| `PublicationEntry` | `#regular-entry(...)` | `main_column`, `date_and_location_column` |
| `OneLineEntry` | — (inline) | `main_column` |
| `BulletEntry` | — (inline) | `bullet` |
| `NumberedEntry` | — (inline) | `number` |
| `ReversedNumberedEntry` | — (inline) | `reversed_number` |
| `TextEntry` | — (inline) | `entry` |

## Using Your Theme

Set the theme in your YAML input file:

```yaml
design:
  theme: mytheme
```

Then render as usual:

```bash
rendercv render Your_Name_CV.yaml
```

## Tips

- Delete entry template files you don't customize — RenderCV falls back to built-in versions
- Edit the generated `.j2.typ` files directly for fine-tuning; they are simplified Typst-like templates
- Add custom design options by editing `__init__.py`
- The Preamble template is passed through as-is (no variable substitution) — customize it with `// @template Preamble`
