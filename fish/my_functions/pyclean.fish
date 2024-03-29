function pyclean --description 'Recursively clean directory from .pyc and .pyo files and python3 __pycache__ folders'
  set -l pathToClean

  if not set -q argv[1]
    set pathToClean .
  else
    set pathToClean $argv
  end

  find $pathToClean -type f -name "*.py[co]" -delete -print -or -type d -name "__pycache__" -delete -print
end
