# Public: Add a Brewcask cask to the boxen/brews tap
#
define brewcask::cask($source = undef) {
  require homebrew

  $caller_module_name_that_works = inline_template('<%= scope.parent.to_hash["name"].split("::").first %>')

  $cask_source = $source ? {
    undef   => "puppet:///modules/${caller_module_name_that_works}/casks/${name}.rb",
    default => $source
  }

  file { "${homebrew::brewsdir}/Casks/${name}.rb":
    source  => $cask_source,
  }
}
