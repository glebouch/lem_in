
int		ft_min_int(int a, int b)
{
	if (a < b)
		return (a);
	return (b);
}

//init un tab de int qui a a 0 la salle start, 1 l'index 1ere salle 
int *ft_init(int n)
{
	int *tab;
	int i = 0;

	if (!(tab = (int *)malloc(sizeof(int) * n)))
		return (NULL);
	while (i < n)
	{
		tab[i] = -1;
		i++;
	}
	return (tab);
}


int		ft_search_path(t_data *data, char *path_i, int *tab_index)
{
	int i = start;
	int j = 1;

	int *tab_path_n_piece;
	int *tab_index_pipe_to_try;

	tab_path_n_piece = ft_init(infos->nb_of_box);
	tab_index_pipe_to_try = ft_init(infos->nb_of_box);

	tab_path_n_piece[0] = start;
	while (infos->data[i]->commands != 2)
	{
		j = 0;
		while (j < tab_index_pipe_to_try[j])
		{
			if (ft_check_precedents(tab_path_n_piece, infos->data[info->data[i]->pipe[tab_index_pipe_to_try[j]]]->n_piece))
			{
				tab_path_n_piece[j] = infos->data[info->data[i]->pipe[tab_index_pipe_to_try[j]]]->n_piece;
				i = tab_path_n_piece[j];
				j++;
			}
			else
				tab_index_pipe_to_try[j]++;
		}
		tab_path_n_piece[i] = t_info->data[start]->n_piece;
	}










//	if (path_i)
//		ft_strcat(path_i, "\n")
//	path_i = ft_strcat(path_i, data->name_box);
	tab_index[i] = data->n_piece;
	while(i < )
	ft_search_path(pipe[i], n, &path_i, &tab_index);
	if (data->commands == 2)
		return (2);
}

int		ft_init_path(t_info *infos, int nb_path_max)
{
	char **path;
	int **tab_int;
	int index_path = 0;
	int i = 0;

	while (i < nb_path_max)
	{
		if (!(path[i] = (char *)malloc(sizeof(char *) * nb_path_max + 2)))
			return(0);
		i++;
	}
	path[i] = NULL;
	i = 0;
	while (infos->data[i]->commands != 1)
		i++;
	while (index_path < nb_path_max)
		ft_search_path(&infos->data[i], &path[index_path], &tab_int[index_path]);
}

int		algo(t_info *infos)
{
	int i = 0;
	int nb_path_max = 0;

	while (i < infos->nb_of_box)
	{
		if (infos->data[i]->commands != 0)
			nb_path_max = (nb_path_max == 0) ? infos->data[i]->nb_of_link : ft_min_int(nb_path_max, infos->data[i]->nb_of_link);
		i++;
	}
	ft_search_path(infos, nb_path_max);
}