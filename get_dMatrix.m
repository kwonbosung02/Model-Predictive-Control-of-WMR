function d = get_dMatrix(states, Acond,idx, params, num, data)

d = (states-data.states)' * Acond' * params.Qcond * Acond * (states-data.states)

end