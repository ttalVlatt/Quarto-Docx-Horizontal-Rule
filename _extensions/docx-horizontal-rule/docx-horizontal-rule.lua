-- Converts default grey horiztonal rule to thin black line (customizable in line 10)
-- h/t https://github.com/jgm/pandoc/issues/2573
-- h/t https://gist.github.com/Merovex/05e3216f8f4f6e965cd9d564b1496719

local color = "00FF00"
local style = "double"

local horizontallinerule = string.format([[<w:p>
  <w:pPr>
    <w:pStyle w:val="HorizontalRule"/>
      <w:ind w:firstLine="0"/>
      <w:jc w:val="center"/>
    <w:pBdr>
      <w:bottom w:val="%s" w:color="%s"/>
    </w:pBdr>
  </w:pPr>
  <w:r>
    <w:t></w:t>
  </w:r>
</w:p>]], style, color)


function HorizontalRule (elem)
    if FORMAT == 'docx' then
      return pandoc.RawBlock('openxml', horizontallinerule)
    end
end
