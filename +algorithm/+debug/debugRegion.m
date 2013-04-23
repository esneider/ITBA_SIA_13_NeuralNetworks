function data = debugRegion(data)

    algorithm.debug.plotRegion(data);

    if (strcmp(data.const.debug, 'video'))

        if (~strcmp(class(data.debug.video), 'VideoWriter'))

            data.debug.video = VideoWriter('video.avi');
            data.debug.video.FrameRate = 15;
            open(data.debug.video);
        end

        writeVideo(data.debug.video, getframe);

    elseif (strcmp(data.const.debug, 'wait'))

        waitforbuttonpress;
    end
end
