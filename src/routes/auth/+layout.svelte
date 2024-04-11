<script lang="ts">
	import '$src/app.css'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
	import AlertBar from '$src/lib/Alert/AlertBar.svelte'
</script>

<AlertBar />
<HeadBar>
	<SvordxCompanyLogo />
</HeadBar>

<slot />
