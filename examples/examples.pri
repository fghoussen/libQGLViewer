# Artis
MAIN_PATH = $$(HOME)/QGLViewer

CONFIG -= debug
CONFIG += release console embed_manifest_exe

# Local on windows
!exists( $${MAIN_PATH}/QGLViewer ) {
  MAIN_PATH = C:/Users/debunne/Documents/Code/libQGLViewer/Alma_libQGLViewer/trunk
}
    
isEmpty( INCLUDE_DIR ) {
  INCLUDE_DIR=$${MAIN_PATH}
}

isEmpty( LIB_DIR ) {
  win32 {
    debug : LIB_DIR=$${MAIN_PATH}/QGLViewer/Debug
    release : LIB_DIR=$${MAIN_PATH}/QGLViewer/Release
  } else {
    LIB_DIR=$${MAIN_PATH}/QGLViewer
  }
}

win32-msvc2005 {
  QT *= xml opengl
  INCLUDEPATH *= $${INCLUDE_DIR}
  #debug : LIBS *= $${LIB_DIR}/QGLViewer2d.lib
  #release : LIBS *= $${LIB_DIR}/QGLViewer2.lib
  LIBS *= $${LIB_DIR}/QGLViewer2.lib
} else {
  include( release.pri )
}

unix {
  QT_VERSION=$$[QT_VERSION]
  contains( QT_VERSION, "^4\..*" ) {
    MOC_DIR = .moc4
    OBJECTS_DIR = .obj4
  } else {
    MOC_DIR = .moc
    OBJECTS_DIR = .obj
  }
  #include ( ../../Code/simpleOutput.prf )
  #CONFIG += simpleOutput.prf moc resource
}
