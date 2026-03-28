class Pijul < Formula
  desc "Distributed version control system based on a theory of patches"
  homepage "https://pijul.org"
  url "https://static.crates.io/crates/pijul/pijul-1.0.0-beta.11.crate"
  sha256 "8a4fc27aa81ee061310d57fce2df9cc45f3149ddb00bdfab2b816beb0359b13d"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :crate do |json|
      json["versions"]&.filter_map do |version|
        next if version["yanked"]

        version["num"]
      end
    end
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "libsodium"
  depends_on "openssl@3"
  depends_on "zstd"

  def install
    ENV["SODIUM_USE_PKG_CONFIG"] = "1"
    ENV["ZSTD_SYS_USE_PKG_CONFIG"] = "1"

    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"pijul", "completion")
  end

  test do
    system bin/"pijul", "init", testpath/"repo"
    assert_path_exists testpath/"repo/.pijul"
  end
end
