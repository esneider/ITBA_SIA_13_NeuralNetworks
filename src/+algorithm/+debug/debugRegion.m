function data = debugRegion(data)

    algorithm.debug.plot.plotRegion(data);

    if (strcmp(data.const.debug, 'video'))

        if (~isa(data.debug.video, 'VideoWriter'))

            data.debug.video = VideoWriter(strcat(data.const.path, 'video.avi'));
            data.debug.video.FrameRate = 15;
            open(data.debug.video);
        end

        writeVideo(data.debug.video, getframe);

    elseif (strcmp(data.const.debug, 'wait'))

        waitforbuttonpress;
    end
end

