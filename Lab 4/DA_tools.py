import matplotlib.pyplot as plt
import numpy as np
light="#FFFCDC"
light_highlight="#FEF590"
mid="#FDED2A"
mid_highlight="#f0dc05"
dark="#EECA02"
dark_highlight="#BB9700"
green="#00FF00"
light_grey="#DDDDDD"

def is_sorted(a):
    '''Check if numpy 1d-array is sorted
    '''
    return np.all(a[:-1] <= a[1:])

def ribbon_plot(x, fx, ax=None,zorder=0):
    '''Plot a ribbon plot for regression and similar.
    Plot consists of quantiles (by 10%) of a variate (fx) as a function of covariate (x).
    x has shape (n, )
    fx has shape (N,n)
    '''
    if ax is None:
        ax = plt.gca()
    if not is_sorted(x):
        print('Sorting')
        arr2D = np.concatenate([np.expand_dims(x,axis=0),fx],axis=0)
        sortedArr = arr2D [ :, arr2D[0].argsort()]
        x = sortedArr[0,:]
        fx = sortedArr[1:,:]

    probs = [10, 20, 30, 40, 50, 60, 70, 80, 90]
    perc_interv=np.percentile(fx, probs, axis=0)
    ax.fill_between(x,perc_interv[0,:],perc_interv[8,:],color=light,zorder=zorder)
    ax.fill_between(x,perc_interv[1,:],perc_interv[7,:],color=light_highlight,zorder=zorder)
    ax.fill_between(x,perc_interv[2,:],perc_interv[6,:],color=mid,zorder=zorder)
    ax.fill_between(x,perc_interv[3,:],perc_interv[5,:],color=mid_highlight,zorder=zorder)
    ax.plot(x,perc_interv[4,:],color=dark,zorder=zorder)
    return(ax)
