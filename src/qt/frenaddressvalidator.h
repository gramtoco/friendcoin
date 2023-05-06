// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Raven Core developers
// Copyright (c) 2023 The Fren Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef FREN_QT_FRENADDRESSVALIDATOR_H
#define FREN_QT_FRENADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class FrenAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FrenAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Fren address widget validator, checks for a valid fren address.
 */
class FrenAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FrenAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // FREN_QT_FRENADDRESSVALIDATOR_H
