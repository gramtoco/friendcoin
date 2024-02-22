// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Pejecoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PEJECOIN_QT_PEJECOINADDRESSVALIDATOR_H
#define PEJECOIN_QT_PEJECOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class PejecoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PejecoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Pejecoin address widget validator, checks for a valid pejecoin address.
 */
class PejecoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PejecoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // PEJECOIN_QT_PEJECOINADDRESSVALIDATOR_H
