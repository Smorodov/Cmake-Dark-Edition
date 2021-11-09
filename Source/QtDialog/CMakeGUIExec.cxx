/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */

#include <QApplication>
#include <QTextStream>
#include <QFile>
class CMakeSetupDialog;

void SetupDefaultQSettings()
{
}

int CMakeGUIExec(CMakeSetupDialog* /*window*/)
{
  QFile f(":qdarkstyle/style.qss");
  if (!f.exists())
  {
    printf("Unable to set stylesheet, file not found\n");
  } else
  {
    f.open(QFile::ReadOnly | QFile::Text);
    QTextStream ts(&f);
    qApp->setStyleSheet(ts.readAll());
  }
  return QApplication::exec();
}
