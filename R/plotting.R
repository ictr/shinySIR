#' Plot model output.

#' This function plots the output of a fitted model data frame.
#' @param output data frame output from solve_eqns().
#' @param linesize numeric value for line width in ggplot.
#' @param textsize numeric value for textsize in ggplot.
#' @param xlabel character string for x axis label.
#' @param ylabel character string for y axis label.
#' @param legend_title character string for legend title.
#' @param levels character vector of the variable names in the order they should be plotted. Default is to obtain the order from the initial conditions vector 'ics'.
#' @param values vector specifying manual color scale. Length must equal the number of model variables.
#' @param ... extra argument to be passed through to ggplot scale_colour_manual: use 'labels' to change the legend names
#' @return ggplot object
#' @import ggplot2

plot_model <- function(output, linesize, textsize, xlabel, ylabel, legend_title, levels, values, ...){

    print(rownames(output))
    print(colnames(output))
    output = output[output$variable == 'I', ]
    output$variable <- factor(output$variable, levels = levels)

    ggplot(output, aes(x = time, y = value, color=as.factor(variable))) +
            geom_line(size = linesize) +
            scale_colour_manual(legend_title, values = values, ...) +
            ylab(ylabel) + xlab(xlabel) +
            theme_bw() + theme(axis.text = element_text(size = textsize),
                               axis.title= element_text(size = textsize + 2),
                               legend.text = element_text(size = textsize),
                               legend.title = element_text(size = textsize + 2) )

}
