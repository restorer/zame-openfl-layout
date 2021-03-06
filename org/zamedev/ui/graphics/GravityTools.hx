package org.zamedev.ui.graphics;

import org.zamedev.ui.errors.UiParseError;
import org.zamedev.ui.tools.generator.GenPosition;

using StringTools;

class GravityTools {
    public static function parse(s : String, ?pos : GenPosition) : Gravity {
        var result : Gravity = {
            horizontalType : GravityType.NONE,
            verticalType : GravityType.NONE
        };

        for (item in s.split("|")) {
            item = item.trim().toLowerCase();

            if (item == "") {
                continue;
            }

            switch (item) {
                case "left":
                    result.horizontalType = GravityType.START;

                case "right":
                    result.horizontalType = GravityType.END;

                case "top":
                    result.verticalType = GravityType.START;

                case "bottom":
                    result.verticalType = GravityType.END;

                case "center":
                    result.horizontalType = GravityType.CENTER;
                    result.verticalType = GravityType.CENTER;

                case "center_horizontal":
                    result.horizontalType = GravityType.CENTER;

                case "center_vertical":
                    result.verticalType = GravityType.CENTER;

                case "start":
                    result.horizontalType = GravityType.START;
                    result.verticalType = GravityType.START;

                case "end":
                    result.horizontalType = GravityType.END;
                    result.verticalType = GravityType.END;

                default:
                    throw new UiParseError('Invalid gravity value: "${s}"', pos);
            }
        }

        return result;
    }
}
