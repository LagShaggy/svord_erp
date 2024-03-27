<script>
	import BasePage from '$lib/UI/BasePage.svelte'
	import Tab from '$lib/UI/Tabs/Tab.svelte'
	import TabBar from '$lib/UI/Tabs/TabBar.svelte'
	import TabContainer from '$lib/UI/Tabs/TabContainer.svelte'
</script>

<BasePage title="FINANCE" description="here you can write a littlebit about the page itself">
	<TabContainer>
		<TabBar>
			<Tab>ONE</Tab>
			<Tab>TWO</Tab>
			<Tab>THREE</Tab>
		</TabBar>
	</TabContainer>
</BasePage>
