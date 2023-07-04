{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_rand_lib_haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/niklas/github/rand-lib-haskell/.stack-work/install/x86_64-linux/091de66965f1ba30dc29af661c4c793f635b94ec99f9a64cd7d844f8a27eaa0c/9.4.5/bin"
libdir     = "/home/niklas/github/rand-lib-haskell/.stack-work/install/x86_64-linux/091de66965f1ba30dc29af661c4c793f635b94ec99f9a64cd7d844f8a27eaa0c/9.4.5/lib/x86_64-linux-ghc-9.4.5/rand-lib-haskell-0.1.0.0-FwkUWHSWGTY5u3ka5qr6zP"
dynlibdir  = "/home/niklas/github/rand-lib-haskell/.stack-work/install/x86_64-linux/091de66965f1ba30dc29af661c4c793f635b94ec99f9a64cd7d844f8a27eaa0c/9.4.5/lib/x86_64-linux-ghc-9.4.5"
datadir    = "/home/niklas/github/rand-lib-haskell/.stack-work/install/x86_64-linux/091de66965f1ba30dc29af661c4c793f635b94ec99f9a64cd7d844f8a27eaa0c/9.4.5/share/x86_64-linux-ghc-9.4.5/rand-lib-haskell-0.1.0.0"
libexecdir = "/home/niklas/github/rand-lib-haskell/.stack-work/install/x86_64-linux/091de66965f1ba30dc29af661c4c793f635b94ec99f9a64cd7d844f8a27eaa0c/9.4.5/libexec/x86_64-linux-ghc-9.4.5/rand-lib-haskell-0.1.0.0"
sysconfdir = "/home/niklas/github/rand-lib-haskell/.stack-work/install/x86_64-linux/091de66965f1ba30dc29af661c4c793f635b94ec99f9a64cd7d844f8a27eaa0c/9.4.5/etc"

getBinDir     = catchIO (getEnv "rand_lib_haskell_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "rand_lib_haskell_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "rand_lib_haskell_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "rand_lib_haskell_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rand_lib_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rand_lib_haskell_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
