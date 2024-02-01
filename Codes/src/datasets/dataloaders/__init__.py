try:
    from .cityscapes_thermal import CityscapesCombineThermalDataset
    from .soda import SODADataset
    from .cartd import CARTDDataset
    from .mfn import MFNDataset
    from .cityscapes_thermal_split import CityscapesThermalsSplitDataset
    from .scutseg import SCUTSEGDataset


except:
    from datasets.dataloaders.cityscapes_thermal import CityscapesCombineThermalDataset
    from datasets.dataloaders.soda import SODADataset
    from datasets.dataloaders.cartd import CARTDDataset
    from datasets.dataloaders.mfn import MFNDataset
    from datasets.dataloaders.cityscapes_thermal_split import CityscapesThermalsSplitDataset
    from datasets.dataloaders.scutseg import SCUTSEGDataset
