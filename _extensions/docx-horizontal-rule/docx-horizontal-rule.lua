-- Title: docx-horizontal-rule Quarto extension
-- Auth: Matt Capaldi (@ttalVlatt)
-- Init: June 18th 2023
-- Updated: June 20th 2023
-- Purpose: Converts default .docx grey horiztonal rule to customizable line

-- Hat Tips
-- h/t https://github.com/jgm/pandoc/issues/2573
-- h/t https://gist.github.com/Merovex/05e3216f8f4f6e965cd9d564b1496719
-- major h/t to Tarleb https://stackoverflow.com/questions/76503253/how-can-you-take-quarto-yaml-metadata-and-use-it-as-a-value-in-lua-filter

-- Create function to change line attributes by input attriubtes, which...
local function change_color (color_picked)
  -- ...has a next function within it with input el (for elements), which...
  return function (el)
    -- ...if true is true (which it will be)...
    if true then
      -- 1) assigns color_picked to color (see below)...
     local color = pandoc.utils.stringify(color_picked)
      -- 2) assigns the word xml to modify horizontal rules to horizontallinerule
      -- which is modified by placeholders "%s" being replaced with color
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
      -- Inner function returns the openxml with horizontallinerule added
      return {
        pandoc.RawBlock('openxml', horizontallinerule)
      }
    end -- End of the then trigger statement
  end -- End of inner function
end -- End of change_color function

-- Create second function that takes choices from the supplied YAML metadata
-- and then uses them in the first function to modify the Pandoc output

-- Function with input doc (for pandoc document), which...
function Pandoc (doc)
  -- ...takes docxhrcolor from the meta and assigns to color_choice,
  -- unless not supplied in which case uses dark grey, then...
  local color_choice = doc.meta['docxhrcolor'] or "5A5A5A"
  -- ...modifies the HorizontalRule in the doc using the first function and
  -- inputs taken from the document meta data
  return doc:walk {
    HorizontalRule = change_color(color_choice),
  }
end -- Phew!