# Quarto-Docx-Horizontal-Rule
A simple Lua filter that converts .docx horizontal rule output from the default to a customizable line (single thin black line by default).

### To use this filter 

  1. Ensure the docx-horizontal-rule extension is in your _extensions folder

  You can install the filter directly in the terminal with
    
  `quarto install extension ttalVlatt/Quarto-Docx-Horizontal-Rule`

  *This assumes your terminal is set to the same directory as your project/.qmd script*

  2. Add the horizontal rule to your markdown

``` md
Insert horizontal rule below here
---
There is my horizontal rule
```

  3. Add the following to your YAML header
  
``` yaml
---
title: "Testing"
format: docx
filters:
  - docx-horizontal-rule
---
```

  4. To customize the line, use the following *optional* fields in your YAML header
  
``` yaml
---
title: "Testing"
format: docx
filters:
  - docx-horizontal-rule
docx-hr-color: takes a color hex code input (no #) 
docx-hr-style: takes the multiple of lines you want (i.e., triple)
docx-hr-width: takes a numeric value for the width of the line in 20th of a ft point
---
```

  5. Here are a few examples of the output

**Single 0.5pt line in black (the default output if no optional fields are supplied)**
    
``` yaml
---
title: "Testing"
format: docx
filters:
  - docx-horizontal-rule
---
```
<img width="800" alt="Screen Shot 2023-06-20 at 12 05 22 PM" src="https://github.com/ttalVlatt/Quarto-Docx-Horizontal-Rule/assets/97192696/fcae367f-f2b0-4256-98bf-f34985850240">

<br /><br />

**Double 0.5pt line in 🐊 orange (note: you can fill some optional fields and leave others to default)**

``` yaml
---
title: "Testing"
format: docx
filters:
  - docx-horizontal-rule
docx-hr-color: FA4616
docx-hr-style: double
---
```
<img width="800" alt="Screen Shot 2023-06-20 at 12 08 19 PM" src="https://github.com/ttalVlatt/Quarto-Docx-Horizontal-Rule/assets/97192696/a97f714b-c62b-4ee6-ad36-edd1f0684512">

<br /><br />

**Triple 0.25pt line in 🐊 blue**

``` yaml
---
title: "Testing"
format: docx
filters:
  - docx-horizontal-rule
docx-hr-color: 0021A5
docx-hr-style: triple
docx-hr-width: 5
---

```
<img width="800" alt="Screen Shot 2023-06-20 at 12 13 05 PM" src="https://github.com/ttalVlatt/Quarto-Docx-Horizontal-Rule/assets/97192696/5d18e57b-d652-4736-9029-80bdc3c53511">

<br /><br />

I wrote this little tool to help format my Quarto CV, but thought it might be useful for the wider community!
