<script lang="ts">
	import AccountDropdown from '$lib/Account/AccountDropdown.svelte'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
</script>

<HeadBar>
	<SvordxCompanyLogo />
	<AccountDropdown />
</HeadBar>

<slot />
