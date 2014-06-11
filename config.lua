--
-- Created by IntelliJ IDEA.
-- User: thurstonjm
-- Date: 6/11/14
-- Time: 1:19 PM
-- To change this template use File | Settings | File Templates.
--

--calculate the aspect ratio of the device
local aspectRatio = display.pixelHeight / display.pixelWidth
application = {
    content = {
        width = aspectRatio > 1.5 and 800 or math.ceil( 1200 / aspectRatio ),
        height = aspectRatio < 1.5 and 1200 or math.ceil( 800 * aspectRatio ),
        scale = "letterBox",
        fps = 60,

        imageSuffix = {
            ["@2x"] = 1.3,
        },
    },
}