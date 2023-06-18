-- Converts default grey horiztonal rule to thin black line (customizable in line 10)
-- h/t https://github.com/jgm/pandoc/issues/2573
-- h/t https://gist.github.com/Merovex/05e3216f8f4f6e965cd9d564b1496719
local horizontallinerule = [[<w:p>
  <w:pPr>
    <w:pStyle w:val="HorizontalRule"/>
      <w:ind w:firstLine="0"/>
      <w:jc w:val="center"/>
    <w:pBdr>
      <w:bottom w:val="single" w:color="000000"/>
    </w:pBdr>
  </w:pPr>
  <w:r>
    <w:t></w:t>
  </w:r>
</w:p>]]
function HorizontalRule (elem)
    if FORMAT == 'docx' then
      return pandoc.RawBlock('openxml', horizontallinerule)
    end
end
