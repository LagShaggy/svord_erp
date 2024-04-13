<script lang="ts">
	import '$src/app.css'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
</script>

<HeadBar>
	<SvordxCompanyLogo />
</HeadBar>

<slot />
