-- Converts default grey horiztonal rule to thin black line (customizable in line 10)
-- h/t https://github.com/jgm/pandoc/issues/2573
-- h/t https://gist.github.com/Merovex/05e3216f8f4f6e965cd9d564b1496719

local function change_color (color_picked)
  
  return function (el)
    
    if color_picked then
      
     local color = pandoc.utils.stringify(color_picked) or "FF0000"
      
     local horizontallinerule = string.format([[<w:p>
      <w:pPr>
        <w:pStyle w:val="HorizontalRule"/>
          <w:ind w:firstLine="0"/>
          <w:jc w:val="center"/>
        <w:pBdr>
          <w:bottom w:val="triple" w:color="%s"/>
        </w:pBdr>
      </w:pPr>
      <w:r>
        <w:t></w:t>
      </w:r>
    </w:p>]], color)

      return {
        pandoc.RawBlock('openxml', horizontallinerule)
      }
    end
  end
end

function Pandoc (doc)
  local color_choice = doc.meta['docxhrcolor']
  return doc:walk {
    HorizontalRule = change_color(color_choice),
  }
end