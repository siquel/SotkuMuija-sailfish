#ifndef TJCALCULATORBACKEND_H
#define TJCALCULATORBACKEND_H


#define PALVELUSAJAN_PITUUS 165


#include <QObject>
#include <QDateTime>
#include <QString>
#include <QDebug>
#include "qtimespan.h"

class TjCalculatorBackend : public QObject
{
    Q_OBJECT

    QDateTime startDate;
    //QDateTime endTime;
    QString tjInDays;
    QString tjInMonths;
    QString tjInWeeks;
    qreal daysDone;
    //void updateDiff();

    Q_PROPERTY(QDateTime startDate READ getStartDate WRITE setStartDate NOTIFY startDateChanged)
    Q_PROPERTY(QString tjInMonths READ getTjInMonths NOTIFY tjInMonthsChanged STORED false)
    Q_PROPERTY(QString tjInDays READ getTjInDays NOTIFY tjInDaysChanged STORED false)
    Q_PROPERTY(QString tjInWeeks READ getTjInWeeks NOTIFY tjInWeeksChanged STORED false)
    Q_PROPERTY(qreal daysDone READ getDaysDone STORED false)

public:
    TjCalculatorBackend(QObject *parent = 0);

    inline const QDateTime &getStartDate() const {
        return startDate;
    }
    inline void setStartDate(const QDateTime &dateTime) {
        startDate = dateTime;
    }

    inline const QString &getTjInDays() const {
        return tjInDays;
    }

    inline const QString &getTjInMonths() const {
        return tjInMonths;
    }

    inline const qreal &getDaysDone() const {
        return daysDone;
    }

    inline const QString &getTjInWeeks() const {
        return tjInWeeks;
    }

    void calculateTj();
private:
    QString calculateTjInMonths(QTimeSpan &difference);
    QString calculateTjInWeeks(QTimeSpan &difference);
signals:
    void startDateChanged();

    void tjInDaysChanged();
    void tjInMonthsChanged();
    void tjInWeeksChanged();
};

#endif // TJCALCULATORBACKEND_H
