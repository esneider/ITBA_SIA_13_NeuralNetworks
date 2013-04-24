function printData(data, file)

    function printData2(str, data)

        switch (class(data))

            case 'struct'

                cellfun(@(name) printData2(strcat(str, '.', name), data.(name)), fieldnames(data));

            case 'cell'

                for pos = 1 : length(data)

                    printData2(strcat(str, '{', num2str(pos), '}'), data{pos});
                end

            otherwise

                len = numel(data);

                if (len == 0)

                    fprintf(file, '%s = [empty]\n', str);

                elseif (len == 1)

                    fprintf(file, '%s = %s', str, evalc('disp(data)'));

                elseif (len < 50)

                    fprintf(file, '%s =\n%s', str, evalc('printmat(data)'));

                else

                    dim = '';

                    for n = size(data)
                        if n > 10
                            dim = strcat(dim, 'end - 9 : end,');
                        else
                            dim = strcat(dim, ':,');
                        end
                    end

                    fprintf(file, '%s = [...] -> %s\n', str, mat2str(size(data)));
                    fprintf(file, '%s', evalc(strcat('printmat(data(', dim(1 : end - 1), '));')));
                end
        end
    end

    if ~isa(file, 'double')
        file = 1;
    end

    fprintf(file, '\n');

    printData2('', data);
end

