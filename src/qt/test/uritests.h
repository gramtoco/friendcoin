// Copyright (c) 2009-2015 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Raven Core developers
// Copyright (c) 2023 The Fren Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef FREN_QT_TEST_URITESTS_H
#define FREN_QT_TEST_URITESTS_H

#include <QObject>
#include <QTest>

class URITests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void uriTests();
};

#endif // FREN_QT_TEST_URITESTS_H
