function prompt_path --description 'Path displayed in prompt'
   if test "$PWD" = "$HOME"
      echo "~"
   else
      echo (basename (pwd))
   end
end
