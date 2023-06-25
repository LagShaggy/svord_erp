<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'

	let title = 'Overview'
</script>

<BasePage
	title="MAIN PAGE"
	description="this it the main page, here you can find information about everything"
>
	<body>
		<h2 class="center">THIS IS THE MAIN PAGE</h2>
	</body>
</BasePage>
<header>
	<h1>{title}</h1>
</header>
