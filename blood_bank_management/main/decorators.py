from django.contrib.auth.decorators import user_passes_test

def api_authenticated_required(function=None, login_url='/api/notauthenticated'):
    actual_decorator = user_passes_test(
        lambda u: u.is_authenticated,
        login_url=login_url,
    )
    if function:
        return actual_decorator(function)
    return actual_decorator

def donor_required(function=None, login_url='/login/'):
    actual_decorator = user_passes_test(
        lambda u: u.is_active and u.is_donor,
        login_url=login_url,
    )
    if function:
        return actual_decorator(function)
    return actual_decorator

def bloodbank_required(function=None, login_url='/login/'):
    actual_decorator = user_passes_test(
        lambda u: u.is_active and u.is_bloodbank,
        login_url=login_url,
    )
    if function:
        return actual_decorator(function)
    return actual_decorator

def hospital_required(function=None, login_url='/login/'):
    actual_decorator = user_passes_test(
        lambda u: u.is_active and u.is_hospital,
        login_url=login_url,
    )
    if function:
        return actual_decorator(function)
    return actual_decorator