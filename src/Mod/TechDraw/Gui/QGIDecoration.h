/***************************************************************************
 *   Copyright (c) 2016 WandererFan <wandererfan@gmail.com>                *
 *                                                                         *
 *   This file is part of the FreeCAD CAx development system.              *
 *                                                                         *
 *   This library is free software; you can redistribute it and/or         *
 *   modify it under the terms of the GNU Library General Public           *
 *   License as published by the Free Software Foundation; either          *
 *   version 2 of the License, or (at your option) any later version.      *
 *                                                                         *
 *   This library  is distributed in the hope that it will be useful,      *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU Library General Public License for more details.                  *
 *                                                                         *
 *   You should have received a copy of the GNU Library General Public     *
 *   License along with this library; see the file COPYING.LIB. If not,    *
 *   write to the Free Software Foundation, Inc., 59 Temple Place,         *
 *   Suite 330, Boston, MA  02111-1307, USA                                *
 *                                                                         *
 ***************************************************************************/

#ifndef DRAWINGGUI_QGIDECORATION_H
#define DRAWINGGUI_QGIDECORATION_H

#include <Mod/TechDraw/TechDrawGlobal.h>

#include <QBrush>
#include <QGraphicsItemGroup>
#include <QPen>


QT_BEGIN_NAMESPACE
class QPainter;
class QStyleOptionGraphicsItem;
QT_END_NAMESPACE

#include <Base/Parameter.h>
#include <Base/Console.h>
#include <Base/Vector3D.h>
#include <Mod/TechDraw/TechDrawGlobal.h>

namespace TechDrawGui
{

class TechDrawGuiExport QGIDecoration : public QGraphicsItemGroup
{
public:
    explicit QGIDecoration(void);
    ~QGIDecoration() {}
    enum {Type = QGraphicsItem::UserType + 173};
    int type() const { return Type;}

    virtual QRectF boundingRect() const;
    virtual void paint(QPainter * painter, const QStyleOptionGraphicsItem * option, QWidget * widget = nullptr );
    virtual void draw();
    void setWidth(double w);
    double getWidth() { return m_width; }
    void setStyle(Qt::PenStyle s);
    void setColor(QColor c);
    QColor getColor(void) { return m_colNormal; }
    void setFill(Qt::BrushStyle bs) { m_brushCurrent = bs; }
    void makeMark(double x, double y);
    void makeMark(Base::Vector3d v);

protected:
    void setPrettyNormal();
    void setPrettyPre();
    void setPrettySel();
    virtual QColor prefNormalColor(void);
    virtual QColor prefPreColor(void);
    virtual QColor prefSelectColor(void);
    QPen m_pen;
    QBrush m_brush;
    QColor m_colCurrent;
    QColor m_colNormal;
    double m_width;
    Qt::PenStyle m_styleCurrent;
    Qt::BrushStyle m_brushCurrent;

private:
};

}
#endif
