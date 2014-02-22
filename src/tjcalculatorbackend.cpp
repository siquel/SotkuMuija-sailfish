#include "tjcalculatorbackend.h"
#include "qtimespan.h"
#include <QDate>




TjCalculatorBackend::TjCalculatorBackend(QObject *parent) :
    QObject(parent)
{
    QDate date(2014, 1, 6);
    startDate = QDateTime(date);
    startDate.setTime(QTime(15,0));
    tjInDays = "QString()";
    calculateTj();
}

void TjCalculatorBackend::calculateTj() {

    tjInDays = QString();

    QDateTime now = QDateTime::currentDateTime();

    QDateTime endDate(QDate(2014,6,19));
    endDate.setTime(QTime(15,0));
    QTimeSpan span = endDate - now;


    // pitää laskea kans viiminen päivä mukaan
    int diffDays = (int)span.toDays() + 1;
    daysDone = (qreal)(((qreal)PALVELUSAJAN_PITUUS - (qreal)diffDays) / (qreal)PALVELUSAJAN_PITUUS ) * 100.0f;
    qDebug() << "tjcalc " <<  daysDone  << " wat?";
    if (diffDays != 1) {
        diffDays = qAbs(diffDays);
        tjInDays = QString::number(diffDays);
        tjInDays += diffDays == 1 ? " aamu" : " aamua";

        tjInMonths = calculateTjInMonths(span);
        tjInWeeks = calculateTjInWeeks(span);
    }


    emit tjInDaysChanged();
    emit tjInMonthsChanged();
}

QString TjCalculatorBackend::calculateTjInMonths(QTimeSpan &difference) {
    qreal diffmonths = difference.toMonths();
    QString monthstr = QString::number(diffmonths, 'f', 1);

    return monthstr + (monthstr == "1" ? " kuukausi" : " kuukautta");
}
QString TjCalculatorBackend::calculateTjInWeeks(QTimeSpan &difference) {
    qreal diffweeks = difference.toWeeks();
    QString weekstr = QString::number(diffweeks, 'f', 1);
    return weekstr + (weekstr == "1" ? " viikko" : " viikkoa");
}
