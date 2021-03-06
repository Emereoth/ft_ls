/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrmv.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: acottier <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/03/18 11:49:15 by acottier          #+#    #+#             */
/*   Updated: 2016/03/18 15:37:30 by acottier         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdio.h>

char	*ft_strrmv(char	*str, char	c)
{
	int		length;
	int		i;
	char	*res;

	length = 0;
	i = 0;
	while (str[i])
	{
		if (str[i] != c)
			length++;
		i++;
	}
	res = ft_strnew(length);
	i = 0;
	length = 0;
	while (str[i])
	{
		if (str[i] != c)
		{	
			res[length] = str[i];
			length++;
		}
		i++;
	}
	ft_strdel(&str);
	return (res);
}
