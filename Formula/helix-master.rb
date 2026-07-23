class HelixMaster < Formula
  desc "Post-modern modal text editor (master/nightly build)"
  homepage "https://helix-editor.com/"
  version "25.7.1+a47389402c"
  license "MPL-2.0"
  # helix_commit: a47389402c

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-macos.tar.xz"
      sha256 "d12d89080edbccaddf691fcc2757663daba67949eba6c8a19202069f827910b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-linux.tar.xz"
      sha256 "303d40475719342a4bed236c6eb0710a1c87de9f56f50d33c9bceaa6f8142ec1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-x86_64-linux.tar.xz"
      sha256 "c82af0e520ef38797a9e9faa4077d6c498de72c63e82d16338a958da80f185d3"
    end
  end

  conflicts_with "helix", because: "both install a `hx` binary"

  def install
    bin.install "hx"
    libexec.install "runtime"
    bin.env_script_all_files libexec/"bin", HELIX_RUNTIME: libexec/"runtime"
  end

  test do
    assert_match "helix", shell_output("#{bin}/hx --version")
  end
end
