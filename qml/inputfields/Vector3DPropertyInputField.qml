/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt3D Editor of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2

PropertyInputField {
    id: vectorPropertyInputField
    width: parent.width
    height: vectorInputField.height

    property alias label: vectorInputField.label
    property alias xLabel: vectorInputField.xLabel
    property alias yLabel: vectorInputField.yLabel
    property alias zLabel: vectorInputField.zLabel
    property alias roundDigits: vectorInputField.roundDigits

    onComponentValueChanged: {
        // TODO: Changing value to (0,0,0) via e.g. undo doesn't trigger this slot,
        // TODO: see: https://bugreports.qt.io/browse/QTBUG-50204
        // TODO: Some kind of workaround may be needed unless Qt bug is fixed.
        vectorInputField.value = component[propertyName]
    }

    Vector3DInputField {
        id: vectorInputField
        onValueEdited: {
            handleEditingFinished(value)
        }
    }
}