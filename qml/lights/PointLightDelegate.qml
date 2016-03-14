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
import com.theqtcompany.SceneEditor3D 1.0

Item {
    id: thisItem
    width: parent.width
    height: columnLayout.y + columnLayout.height + 8

    property int componentType: EditorSceneItemComponentsModel.Light
    property bool initialState: true
    property color selectedColor: "#ffffff"
    property double selectedIntensity: 1

    Component.onCompleted: {
        initialState = false
        if (parent.newColor !== selectedColor)
            colorField.component[colorField.propertyName] = parent.newColor
        if (parent.newIntensity !== selectedIntensity)
            intensityField.component[intensityField.propertyName] = parent.newIntensity
    }

    Column {
        id: columnLayout
        spacing: 4
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8

        ColorPropertyInputField {
            id: colorField
            label: qsTr("Color") + editorScene.emptyString
            propertyName: "color"
            component: lightComponentData
            componentType: thisItem.componentType
            onColorValueChanged: {
                if (selectedColor !== colorValue && !thisItem.initialState)
                    thisItem.parent.setNewColor(colorValue)
            }
        }

        FloatPropertyInputField {
            id: intensityField
            label: qsTr("Intensity") + editorScene.emptyString
            propertyName: "intensity"
            component: lightComponentData
            componentType: thisItem.componentType
            onFieldValueChanged: {
                if (selectedIntensity !== fieldValue && !thisItem.initialState)
                    thisItem.parent.setNewIntensity(fieldValue)
            }
        }

        Vector3DPropertyInputField {
            label: qsTr("Attenuation") + editorScene.emptyString
            propertyName: "attenuation"
            component: lightComponentData
            componentType: thisItem.componentType
        }
    }
}
