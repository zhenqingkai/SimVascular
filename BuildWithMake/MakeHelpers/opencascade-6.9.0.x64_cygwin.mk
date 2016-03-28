ifeq ($(CLUSTER), x64_cygwin)
    OPENCASCADE_SRCDIR = $(OPEN_SOFTWARE_SOURCES_TOPLEVEL)/opencascade-6.9.0
    OPENCASCADE_BINDIR = $(OPEN_SOFTWARE_BINARIES_TOPLEVEL)/opencascade-6.9.0-vtk6.2
    OPENCASCADE_INCDIR   = -I$(OPENCASCADE_SRCDIR)/inc
    ifeq ($(MAKE_WITH_OPENCASCADE_SHARED),1)
      OPENCASCADE_LIBDIR   = $(OPENCASCADE_BINDIR)/out/lib/RelWithDebInfo
    else
      OPENCASCADE_LIBDIR   = $(OPENCASCADE_BINDIR)/out/lib/RelWithDebInfo
    endif
    OPENCASCADE_SO_PATH  = $(OPENCASCADE_BINDIR)/out/bin/RelWithDebInfo
    OPENCASCADE_LIBS     = $(LIBPATH_COMPILER_FLAG)$(OPENCASCADE_LIBDIR) \
		$(LIBFLAG)PTKernel$(LIBLINKEXT) \
		$(LIBFLAG)TKBin$(LIBLINKEXT) \
		$(LIBFLAG)TKBinL$(LIBLINKEXT) \
		$(LIBFLAG)TKBinXCAF$(LIBLINKEXT) \
		$(LIBFLAG)TKBO$(LIBLINKEXT) \
		$(LIBFLAG)TKBool$(LIBLINKEXT) \
		$(LIBFLAG)TKBRep$(LIBLINKEXT) \
		$(LIBFLAG)TKCAF$(LIBLINKEXT) \
		$(LIBFLAG)TKCDF$(LIBLINKEXT) \
		$(LIBFLAG)TKernel$(LIBLINKEXT) \
		$(LIBFLAG)TKFeat$(LIBLINKEXT) \
		$(LIBFLAG)TKFillet$(LIBLINKEXT) \
		$(LIBFLAG)TKG2d$(LIBLINKEXT) \
		$(LIBFLAG)TKG3d$(LIBLINKEXT) \
		$(LIBFLAG)TKGeomAlgo$(LIBLINKEXT) \
		$(LIBFLAG)TKGeomBase$(LIBLINKEXT) \
		$(LIBFLAG)TKHLR$(LIBLINKEXT) \
		$(LIBFLAG)TKIGES$(LIBLINKEXT) \
		$(LIBFLAG)TKIVtk$(LIBLINKEXT) \
		$(LIBFLAG)TKLCAF$(LIBLINKEXT) \
		$(LIBFLAG)TKMath$(LIBLINKEXT) \
		$(LIBFLAG)TKMesh$(LIBLINKEXT) \
		$(LIBFLAG)TKMeshVS$(LIBLINKEXT) \
		$(LIBFLAG)TKNIS$(LIBLINKEXT) \
		$(LIBFLAG)TKOffset$(LIBLINKEXT) \
		$(LIBFLAG)TKOpenGl$(LIBLINKEXT) \
		$(LIBFLAG)TKPCAF$(LIBLINKEXT) \
		$(LIBFLAG)TKPLCAF$(LIBLINKEXT) \
		$(LIBFLAG)TKPrim$(LIBLINKEXT) \
		$(LIBFLAG)TKPShape$(LIBLINKEXT) \
		$(LIBFLAG)TKService$(LIBLINKEXT) \
		$(LIBFLAG)TKShapeSchema$(LIBLINKEXT) \
		$(LIBFLAG)TKShHealing$(LIBLINKEXT) \
		$(LIBFLAG)TKStdLSchema$(LIBLINKEXT) \
		$(LIBFLAG)TKStdSchema$(LIBLINKEXT) \
		$(LIBFLAG)TKSTEP$(LIBLINKEXT) \
		$(LIBFLAG)TKSTEP209$(LIBLINKEXT) \
		$(LIBFLAG)TKSTEPAttr$(LIBLINKEXT) \
		$(LIBFLAG)TKSTEPBase$(LIBLINKEXT) \
		$(LIBFLAG)TKSTL$(LIBLINKEXT) \
		$(LIBFLAG)TKTopAlgo$(LIBLINKEXT) \
		$(LIBFLAG)TKV3d$(LIBLINKEXT) \
		$(LIBFLAG)TKVoxel$(LIBLINKEXT) \
		$(LIBFLAG)TKVRML$(LIBLINKEXT) \
		$(LIBFLAG)TKXCAF$(LIBLINKEXT) \
		$(LIBFLAG)TKXCAFSchema$(LIBLINKEXT) \
		$(LIBFLAG)TKXDEIGES$(LIBLINKEXT) \
		$(LIBFLAG)TKXDESTEP$(LIBLINKEXT) \
		$(LIBFLAG)TKXMesh$(LIBLINKEXT) \
		$(LIBFLAG)TKXml$(LIBLINKEXT) \
		$(LIBFLAG)TKXmlL$(LIBLINKEXT) \
		$(LIBFLAG)TKXmlXCAF$(LIBLINKEXT) \
		$(LIBFLAG)TKXSBase$(LIBLINKEXT)
endif