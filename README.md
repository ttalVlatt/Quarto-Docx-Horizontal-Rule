# Quarto-Docx-Horizontal-Rule
A simple Lua filter that converts .docx horizontal rule output from the default to a customizable thinner black line.

To use this filter 

  1. ensure the Horizontal-Rule file is in your _extensions

and

  2. add the following to your yaml header
  
``` yaml
---
filters:
  - docx-horizontal-rule
---
```

If you wish to customize the line generated, you can edit line 10 of the .lua script

```      <w:bottom w:val="single" w:color="000000"/>```

For example, to have the line be red and not black it would become

```      <w:bottom w:val="single" w:color="FF0000"/>```

Or, to make it a double line it would become

```      <w:bottom w:val="double" w:color="000000"/>```

I wrote this little tool to help format my Quarto CV, but thought it might be useful for the wider community!
