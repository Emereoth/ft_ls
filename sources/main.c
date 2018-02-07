/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: acottier <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/03/09 12:22:07 by acottier          #+#    #+#             */
/*   Updated: 2016/06/25 17:43:05 by acottier         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/ft_ls.h"

void			ft_free_list(t_arg *lst)
{
	t_arg	*following;

	while (lst)
	{
		free(lst->path);
		following = lst->next;
		free(lst);
		lst = following;
	}
}

int				main(int argc, char **argv)
{
	int		err;
	char	errchar;
	char	*options;
	t_arg	*arguments;

	(void)argc;
	options = ft_treat_opts(argv, &err, &errchar);
	if (err != 0)
		ft_error(err, argv, errchar, 0);
	else
	{
		arguments = ft_treat_args(argv, options);
		ft_global_treat(options, arguments);
		ft_free_list(arguments);
	}
	free(options);
	return (0);
}
